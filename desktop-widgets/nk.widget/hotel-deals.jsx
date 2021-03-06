import { css } from 'uebersicht';
import * as request from 'superagent';
import hash from 'object-hash';

import {
  getObject,
  setObject,
  cache,
} from './lib/localStorage';

const USER_AGENT = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36';

const MARRIOTT_SCRAPE = (dealDoc, dealDOM) => ({
  heading: dealDoc.querySelector('.offer-title').innerText,
  description: dealDoc.querySelector('.offer-summary p:first-of-type').innerText.replace(/\n\s*\n/g, '\n'),
  price: dealDoc.querySelector('.rates-info') == null ? null : dealDoc.querySelector('.rates-info').innerText,
  url: 'https://www.marriott.com' + dealDOM.querySelector('a').getAttribute('href'),
  valid: dealDoc.querySelector('.m-offers-quick-info p:first-of-type') == null ? null : dealDoc.querySelector('.m-offers-quick-info p:first-of-type').innerText,
});

const TEMPLATE_MARRIOTT = {
  scrapers: [{
    dealsSelector: '.is-hws-deal-txt',
    navigate: dealDOM => 'https://www.marriott.com' + dealDOM.querySelector('a').getAttribute('href'),
    scrape: MARRIOTT_SCRAPE,
  }, {
    dealsSelector: '.m-rewards-hub-container',
    navigate: dealDOM => 'https://www.marriott.com' + dealDOM.querySelector('a').getAttribute('href'),
    scrape: MARRIOTT_SCRAPE,
  }],
};

const PAGES = [{
  ...TEMPLATE_MARRIOTT,
  title: 'St Regis Langkawi',
  url: 'https://www.marriott.com/hotels/hotel-deals/lgkxr-the-st-regis-langkawi/',
}, {
  ...TEMPLATE_MARRIOTT,
  title: 'Andaman Langkawi',
  url: 'https://www.marriott.com/hotels/hotel-deals/lgklc-the-andaman-a-luxury-collection-resort-langkawi/',
}, {
  ...TEMPLATE_MARRIOTT,
  title: 'St Regis KL',
  url: 'https://www.marriott.com/hotels/hotel-deals/kulxr-the-st-regis-kuala-lumpur/',
}, {
  ...TEMPLATE_MARRIOTT,
  title: 'W Hotel KL',
  url: 'https://www.marriott.com/hotels/hotel-deals/kulwh-w-kuala-lumpur/',
}, {
  ...TEMPLATE_MARRIOTT,
  title: 'Westin Langkawi',
  url: 'https://www.marriott.com/hotels/hotel-deals/lgkwi-the-westin-langkawi-resort-and-spa/',
}, {
  ...TEMPLATE_MARRIOTT,
  title: 'Courtyard Hakuba',
  url: 'https://www.marriott.com/hotels/hotel-deals/mmjch-courtyard-hakuba/',
}, {
  ...TEMPLATE_MARRIOTT,
  title: 'Marriott Karuizawa',
  url: 'https://www.marriott.com/hotels/hotel-deals/mmjkh-karuizawa-marriott-hotel/',
}, {
  ...TEMPLATE_MARRIOTT,
  title: 'JW Marriott KL',
  url: 'https://www.marriott.com/hotels/hotel-deals/kuldt-jw-marriott-hotel-kuala-lumpur/',
}, {
  ...TEMPLATE_MARRIOTT,
  title: 'Meridien KL',
  url: 'https://www.marriott.com/hotels/hotel-deals/kulmd-le-meridien-kuala-lumpur/',
}, {
  ...TEMPLATE_MARRIOTT,
  title: 'Marriott Putrajaya',
  url: 'https://www.marriott.com/hotels/hotel-deals/kulpg-putrajaya-marriott-hotel/',
}, {
  ...TEMPLATE_MARRIOTT,
  title: 'St Regis Bali',
  url: 'https://www.marriott.com/hotels/hotel-deals/dpsxr-the-st-regis-bali-resort/',
}, {
  ...TEMPLATE_MARRIOTT,
  title: 'Renaissance Bali',
  url: 'https://www.marriott.com/hotels/hotel-deals/dpsuw-renaissance-bali-uluwatu-resort-and-spa/',
}, {
  title: 'Majestic KL',
  url: 'http://www.majestickl.com/offers.html',
  scrapers: [{
    dealsSelector: '.advant-item-offer',
    scrape: dealDOM => ({
      heading: dealDOM.querySelector('.advant-title').innerText,
      description: [...dealDOM.querySelectorAll('.advant-text p')].reduce((a, e) => a + '\n' + e.innerText, ''),
      price: lineContainingText(dealDOM.querySelector('.advant-text').innerText, 'per night', /^.*per night/),
    }),
  }],
}];

const PROXY = 'http://127.0.0.1:41417/'
const PARSER = new DOMParser();
const WIDTH = '500px';

export const refreshFrequency = 600000; // ms / 1h

export const className = css({
  position: 'absolute',
  top: 0,
  left: 0,
  color: '#fff',
  fontSize: '12px',
  fontFamily: '"M+ 1m"',
  fontWeight: 400,
  maxWidth: WIDTH,
  margin: '16px',
  h3: {
    fontSize: '12px',
    fontWeight: 400,
  },
  ul: {
    margin: 0,
    padding: 0,
    listStyle: 'none',
    width: WIDTH,
  },
  li: {
    fontSize: '12px',
  },
  '.result-title': {
    '&--unseen': {
      color: 'orange',
    },
  },
  '.expand-result': {
    color: 'cyan',
  },
  '.deals': {
    display: 'none',
    '&-expanded': {
      display: 'block',
    },
  },
  '.deal': {
    background: '#000',
    marginBottom: '16px',
    width: WIDTH,
  },
  '.deal-description': {
    color: '#ccc',
  },
  '.deal-url': {
    width: '10%',
    color: '#fff',
    a: {
      color: '#fff',
    },
  },
  '.deal-valid': {
    width: '45%',
    color: '#fff',
  },
  '.deal-price': {
    width: '45%',
    fontWeight: 'bold',
    textAlign: 'right',
  },
});

export const command = dispatch => {
  for (var i = 0; i < PAGES.length; i++) {
    const page = PAGES[i];
    const cacheKeyObj = { widget: 'hotels', url: page.url }
    const cacheKey = hash(cacheKeyObj);

    cache(cacheKey, 60 * 60 * 24, () => request
      .get(PROXY + page.url)
      .set('User-Agent', USER_AGENT)
      .then(response =>
        Promise.all(page.scrapers.reduce(
          (results, scraper) =>
            results.concat(
              [...(PARSER.parseFromString(response.text, 'text/html').querySelectorAll(scraper.dealsSelector))]
                .filter(dealDOM => scraper.dealsFilter == null ? true : scraper.dealsFilter(dealDOM))
                .map(dealDOM =>
                  scraper.navigate == null
                  ? Promise.resolve(scraper.scrape(dealDOM))
                  : request
                    .get(PROXY + scraper.navigate(dealDOM))
                    .set('User-Agent', USER_AGENT)
                    .then(response => PARSER.parseFromString(response.text, 'text/html'))
                    .then(dealDoc => scraper.scrape(dealDoc, dealDOM))
                )
            ), []))))
      .then(deals => {
        const dealsHash = hash(deals);

        let unseen = false;
        for (var i = 0; i < 7; i++) {
          const seenHash = getObject(hash({ ...cacheKeyObj, lastSeen: true }));
          if (seenHash !== dealsHash) {
            unseen = true;
          }
        }

        dispatch({
          type: 'PAGE_UPDATE',
          page,
          deals,
          unseen,
        });
      });
  }
};

export const initialState = {
  expandedResult: '',
  results: {},
};

export const updateState = (event, previousState) => {
  switch (event.type) {
    case 'TOGGLE_EXPAND':
      const newResults1 = { ...previousState.results };
      newResults1[event.resultTitle] = {
        ...newResults1[event.resultTitle],
        unseen: false,
      };
      return {
        ...previousState,
        results: newResults1,
        expandedResult: previousState.expandedResult === event.resultTitle ? '' : event.resultTitle,
      };
    case 'PAGE_UPDATE':
      const newResults2 = { ...previousState.results };
      newResults2[event.page.title] = {
        title: event.page.title,
        url: event.page.url,
        deals: event.deals,
        unseen: event.unseen,
      };
      return {
        ...previousState,
        results: newResults2,
      };
    default:
      return {
        ...previousState,
      };
  }
};

export const render = (props, dispatch) => (
  <ul>
    {Object
      .keys(props.results)
      .filter(resultKey => props.results[resultKey].deals.length > 0)
      .map(resultKey => {
        const result = props.results[resultKey];
        return (
          <li key={result.title}>
            <h3 className={`result-title ${result.unseen ? 'result-title--unseen' : ''}`}><a
                  onClick={() => {
                    setObject(hash({ widget: 'hotels', url: result.url, lastSeen: true }), hash(result.deals));
                    dispatch({ type: 'TOGGLE_EXPAND', resultTitle: result.title });
                  }}
                  className="expand-result">[{result.deals.length}]</a> {result.title}</h3>

            <div className={`deals ${props.expandedResult === result.title ? 'deals-expanded' : ''}`}>
              {result.deals.map(deal => (
                <table className='deal' key={deal.heading}>
                  <tbody>
                    <tr>
                      <td className="deal-heading" colSpan="3">
                        {deal.heading}
                      </td>
                    </tr>
                    <tr>
                      <td className="deal-description" colSpan="3">
                        {deal.description}
                      </td>
                    </tr>
                    <tr>
                      <td className="deal-url">
                        {deal.url == null ? null : (
                          <a href={deal.url}>View</a>
                        )}
                      </td>
                      <td className="deal-valid">
                        {deal.valid == null ? null : deal.valid}
                      </td>
                      <td className="deal-price">
                        {deal.price == null ? null : deal.price}
                      </td>
                    </tr>
                  </tbody>
                </table>
              ))}
            </div>
          </li>
        );
      })}
  </ul>
);

function lineContainingText(fullText, searchText, returnRegexpMatch = /.*/) {
  for (const line of fullText.split('\n')) {
    if (line.toLowerCase().includes(searchText.toLowerCase())) {
      return returnRegexpMatch.exec(line)[0];
    }
  }
  return '';
}
