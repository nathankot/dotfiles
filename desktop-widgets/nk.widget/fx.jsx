import { css } from 'uebersicht';
import * as request from 'superagent';

import { CURRENCY_LAYER_API_KEY } from './private.json';

const PROXY = 'http://127.0.0.1:41417/';
const SYMBOLS = ['NZD', 'JPY', 'BTC', 'MYR'];

export const refreshFrequency = 60 * 1000 * 120;

export const className = css({
  margin: 16,
  fontSize: 16,
  top: 0,
  right: 0,
  color: 'white',
  fontFamily: '"M+ 1m"',
  fontSize: 16,
  fontWeight: 400,
  table: {
    borderCollapse: 'collapse',
    textAlign: 'right',
  },
  td: {
    padding: '0.375em 2em',
    margin: 0,
    borderLeft: '1px solid rgba(255, 255, 255, 0.1)',
    '&:first-of-type': {
      borderLeft: 0,
    },
    '&:last-of-type': {
      color: 'rgba(255, 255, 255, 0.7)',
      textAlign: 'right',
      paddingRight: 0,
    },
    '&.error': {
      textAlign: 'center',
    },
  },
});

export const command = dispatch => {
  request
    .get(PROXY + `http://apilayer.net/api/live?access_key=${CURRENCY_LAYER_API_KEY}&currencies=${SYMBOLS}&source=USD&format=1`)
    .then(response => {
      dispatch({
        type: 'UPDATE_RESULTS',
        results: response.body,
      });
    });
};

export const initialState = {
  results: {},
};

export const updateState = (event, previousState) => {
  switch (event.type) {
    case 'UPDATE_RESULTS':
      console.log(event.results);
      return {
        ...previousState,
        results: event.results,
      };
    default:
      return previousState;
  }
};

export const render = (props, dispatch) => (
  <table>
    <tbody>
      {Object.keys(props.results.quotes).map(key => (
        <tr>
          <td>{key}</td>
          <td>{props.results.quotes[key]}</td>
        </tr>
      ))}
    </tbody>
  </table>
);
