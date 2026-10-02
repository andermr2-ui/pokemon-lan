#===============================================================================
# Bolsillo propio para las megapiedras, en vez de mezcladas en "Objetos"
# (pocket 1). Mismo patron que ya usa el plugin "[DBK] Z-Power" para su
# bolsillo de Cristales Z (pocket 9) - encadenar un alias sobre
# Settings.bag_pocket_names y extender los arrays de tamaño/autosort.
#
# El numero de bolsillo (10) es el siguiente libre: los 8 vanilla son
# 1-8, y Z-Power ya toma el 9 para los Cristales Z.
#
# Las megapiedras en si (@pocket = 1 -> 10) se cambiaron directo en
# Data/items.dat (y PBS/items.txt para que quede sincronizado si alguna vez
# se recompila el PBS) via tools/move_megastones_to_new_pocket.py - esto
# solo se encarga de que el bolsillo 10 EXISTA con nombre propio.
#===============================================================================
module Settings
  MEGASTONE_BAG_POCKET = 10
  MEGASTONE_BAG_POCKET_NAME = _INTL("Mega Piedras")

  singleton_class.alias_method :megastone_bag_pocket_names, :bag_pocket_names unless singleton_class.method_defined?(:megastone_bag_pocket_names)
  def self.bag_pocket_names
    names = megastone_bag_pocket_names
    idx = MEGASTONE_BAG_POCKET - 1
    names.push("") while names.length <= idx   # por si algun otro pocket dinamico crea un hueco antes
    names[idx] = MEGASTONE_BAG_POCKET_NAME
    return names
  end

  BAG_MAX_POCKET_SIZE.push(-1)    while BAG_MAX_POCKET_SIZE.length < MEGASTONE_BAG_POCKET
  BAG_POCKET_AUTO_SORT.push(true) while BAG_POCKET_AUTO_SORT.length < MEGASTONE_BAG_POCKET
end
