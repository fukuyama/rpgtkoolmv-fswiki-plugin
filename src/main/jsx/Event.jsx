import React from 'react';

function pad (n, len) {
  var s = n.toString();
  while (s.length < len) {
    s = '0' + s;
  }
  return s;
};

export default function Event({ event }) {
  return (
    <div className="eventNode">
      <table>
        <tr>
        <td>{pad(event.id,3)}</td>
        <td>{event.name}</td>
        <td>({event.x},{event.y})</td>
        </tr>
      </table>
    </div>
  );
}
