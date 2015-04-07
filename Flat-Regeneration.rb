=begin
Flat Regeneration Rates v0.1, by Feldherren (rpaliwoda@googlemail.com)

Updates:
  v0.1 - flat regeneration enabled for HP, SP and TP

VX Ace loves percentages. I don't. This script adds non-scaled flat regeneration rates for HP, MP and TP. This doesn't overwrite any percentage-based regeneration battlers have going on; it just allows for a character to regenerate 1 MP a turn no matter what happens, if you want.

Actor tags:
  <regenerate hp: x>
  <regenerate mp: x>
  <regenerate tp: x>
    Put any of these tags in an actor's notebox. They'll regenerate x hp/mp/tp as specified at the end of the turn, in addition to any percentage-based rates they have through default VX Ace.
=end
module Regeneration
  MATCH_HP = /<regenerate hp:\s*(\d*)>/i
  MATCH_MP = /<regenerate mp:\s*(\d*)>/i
  MATCH_TP = /<regenerate tp:\s*(\d*)>/i
end
class Game_Battler < Game_BattlerBase
  #--------------------------------------------------------------------------
  # * Regenerate HP
  #--------------------------------------------------------------------------
  alias :regenerate_hp_edit :regenerate_hp
  def regenerate_hp
    :regenerate_hp_edit
    if self.actor?
      self.hp += ($data_actors[self.id].note.match(Regeneration::MATCH_HP) ? $data_actors[self.id].note.match(Regeneration::MATCH_HP)[1].to_i : 0)
    end
  end
  #--------------------------------------------------------------------------
  # * Regenerate MP
  #--------------------------------------------------------------------------
  alias :regenerate_mp_edit :regenerate_mp
  def regenerate_mp
    :regenerate_mp_edit
    if self.actor?
      self.mp += ($data_actors[self.id].note.match(Regeneration::MATCH_MP) ? $data_actors[self.id].note.match(Regeneration::MATCH_MP)[1].to_i : 0)
    end
  end
  #--------------------------------------------------------------------------
  # * Regenerate TP
  #--------------------------------------------------------------------------
  alias :regenerate_tp_edit :regenerate_tp
  def regenerate_tp
    :regenerate_tp_edit
    if self.actor?
      self.tp += ($data_actors[self.id].note.match(Regeneration::MATCH_TP) ? $data_actors[self.id].note.match(Regeneration::MATCH_TP)[1].to_i : 0)
    end
  end
end