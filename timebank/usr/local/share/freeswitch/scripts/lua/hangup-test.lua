--[[

  Copyright (C) 2016 Open Lab Athens.

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.

  @license GPL-3.0+ <http://spdx.org/licenses/GPL-3.0+>


  Changes

  15-8-2016: Rowan Thorpe <rowan@rowanthorpe.com>: Original commit

]]

function on_hangup(s,status)
   freeswitch.consoleLog("NOTICE","---- on_hangup: "..status.."\n")
--   s:destroy("hangup")
   return "exit"
--   error()
end

freeswitch.consoleLog("NOTICE","---- ANSWER\n")
session:answer()
freeswitch.consoleLog("NOTICE","---- SETHOOK\n")
session:setHangupHook("on_hangup")

while session:ready() do
   freeswitch.consoleLog("NOTICE","---- START OF LOOP\n")
   freeswitch.consoleLog("NOTICE","---- STREAMFILE\n")
   session:streamFile("/usr/share/freeswitch/sounds/music/default/8000/ponce-preludio-in-e-major.wav")
   freeswitch.consoleLog("NOTICE","---- END OF LOOP\n")
end
freeswitch.consoleLog("NOTICE","---- END OF SCRIPT\n")
session:hangup()
