import React     from 'react';
import ReactDOM  from 'react-dom';

import EventView from './EventView.jsx';

global.eventRender = function(id,data) {
  ReactDOM.render(
    <EventView data={data} />,
    document.getElementById(id)
  );
}
