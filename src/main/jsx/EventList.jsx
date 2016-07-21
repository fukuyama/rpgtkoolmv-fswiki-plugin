import React from 'react';

import Event from './Event.jsx';

export default class EventList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const events = this.props.events;
    return (
      <div className="eventList">
        {
          events
          .map((event) => {
            return <Event event={event} />;
          })
        }
      </div>
    );
  }
}
