import riot from 'riot'

import './event-view/event-view.tag.jade'
import './event-list/event-list.tag.jade'
import './event-position/event-position.tag.jade'
import './event-id/event-id.tag.jade'
import './event-name/event-name.tag.jade'

global.event_view = (datamap) => {
  riot.mount('event-view',{datamap : datamap});
}

global.event_detail = () => {
  console.log('event detail');
}
