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

#ifndef _CLINKSHELLEQUIPPACKET_H
#define _CLINKSHELLEQUIPPACKET_H

#include "../../common/cbasetypes.h"

#include "basic.h"

/************************************************************************
 *                                                                       *
 *  We send Linkshellid to which the search is carried out.             *
 *                                                                       *
 ************************************************************************/

class CCharEntity;

class CLinkshellEquipPacket : public CBasicPacket
{
public:
    CLinkshellEquipPacket(CCharEntity* PChar, uint8 number);
};

#endif
