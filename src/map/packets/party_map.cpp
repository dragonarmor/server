﻿/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#include "../../common/socket.h"

#include "party_map.h"

#include "../entities/charentity.h"

CPartyMapPacket::CPartyMapPacket(CCharEntity* PChar)
{
    this->setType(0xA0);
    this->setSize(0x18);

    XI_DEBUG_BREAK_IF(PChar == nullptr);

    ref<uint32>(0x04) = PChar->id;
    ref<uint16>(0x08) = PChar->getZone();
    ref<uint16>(0x0A) = PChar->targid;

    ref<float>(0x0C) = PChar->loc.p.x;
    ref<float>(0x10) = PChar->loc.p.y;
    ref<float>(0x14) = PChar->loc.p.z;
}
