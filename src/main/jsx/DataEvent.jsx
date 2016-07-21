import React from 'react';

function Event({ event }) {
  return (
    <div className="Event">
      name : {event.name}
    </div>
  );
}

class EventFilter extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value : ""
    };
    this.handleChange = this.handleChange.bind(this);
  }
  handleChange(event) {
    const value = event.target.value;
    this.props.onChangeFilter({value:value});
    this.setState({value:value});
  }
  render() {
    return (
      <input
        type="text"
        value={this.state.value}
        onChange={this.handleChange} />
    );
  }
}

export default class DataEvent extends React.Component {
  handleChangeFilter(filter) {
    console.log(filter);
  }
  render() {
    const events = this.props.events;
    return (
      <div className="Events">
        <EventFilter onChangeFilter={this.handleChangeFilter} />
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
