import riot from 'riot'

import './checkbox/checkbox.tag.jade'

import './breadcrumb-list/breadcrumb-list.tag.jade'
import './event-view/event-view.tag.jade'
import './event-list/event-list.tag.jade'
import './event-position/event-position.tag.jade'
import './event-id/event-id.tag.jade'
import './event-name/event-name.tag.jade'
import './event-detail/event-detail.tag.jade'
import './event-option/event-option.tag.jade'
import './event-trigger/event-trigger.tag.jade'

import './event-pages/event-pages.tag.jade'
import './event-page/event-page.tag.jade'
import './event-page-num/event-page-num.tag.jade'
import './event-page-conditions/event-page-conditions.tag.jade'
import './event-page-switch/event-page-switch.tag.jade'
import './event-page-self-switch/event-page-self-switch.tag.jade'
import './event-page-item/event-page-item.tag.jade'
import './event-page-actor/event-page-actor.tag.jade'

import './event-commands/event-commands.tag.jade'
import './event-command/event-command.tag.jade'

import './switch-name/switch-name.tag.jade'
import './item-name/item-name.tag.jade'
import './actor-name/actor-name.tag.jade'

import './move-default/move-default.tag.jade'
import './move-type/move-type.tag.jade'
import './move-speed/move-speed.tag.jade'
import './move-route/move-route.tag.jade'
import './move-frequency/move-frequency.tag.jade'

global.event_view = riot.mount('event-view')[0]
