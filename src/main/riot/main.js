import riot from 'riot'

import './event-view/event-view.tag.jade'
import './event-list/event-list.tag.jade'
import './event-position/event-position.tag.jade'
import './event-id/event-id.tag.jade'

global.event_view = riot.mount('event-view')[0]
