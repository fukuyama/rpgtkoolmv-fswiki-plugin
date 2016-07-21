import React from 'react';

import EventFilter from './EventFilter.jsx';
import EventList   from './EventList.jsx';

export default class EventView extends React.Component {
  constructor(props) {
    super(props);
    this.data  = props.data;
    this.state = {
      events : this.dataEvents()
    };
    this.handleChangeFilter = this.handleChangeFilter.bind(this);
  }

  dataEvents() {
    return this.data.events.filter((event) => {
      return (event != null);
    });
  }

  handleChangeFilter({ filter }) {
    const events = this.dataEvents().filter(filter);
    this.setState({
      events : events
    });
  }

  render() {
    return (
      <div className="eventView">
        <EventFilter onChangeFilter={this.handleChangeFilter} />
        <EventList events={this.state.events} />
      </div>
    );
  }
}
