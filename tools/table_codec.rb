# encoding: UTF-8
# Decodifica/codifica el formato binario real de la clase Table de RGSS
# (usada para @data de RPG::Map: la cuadricula de tiles por capa).
# Formato _dump: 5 enteros de 4 bytes (dim, x_size, y_size, z_size, item_count)
# seguidos de item_count enteros de 2 bytes con signo (los IDs de tile).
module TableCodec
  def self.decode(raw_bytes)
    dim, xs, ys, zs, count = raw_bytes[0, 20].unpack("l<5")
    items = raw_bytes[20, count * 2].unpack("s<#{count}")
    { dim: dim, xs: xs, ys: ys, zs: zs, items: items }
  end

  def self.encode(tbl)
    header = [tbl[:dim], tbl[:xs], tbl[:ys], tbl[:zs], tbl[:items].length].pack("l<5")
    header + tbl[:items].pack("s<#{tbl[:items].length}")
  end

  # value(tbl, x, y, z) -- z es la capa (0,1,2 en RMXP: suelo, objetos, techo)
  def self.get(tbl, x, y, z)
    idx = (z * tbl[:ys] + y) * tbl[:xs] + x
    tbl[:items][idx]
  end

  def self.set(tbl, x, y, z, value)
    idx = (z * tbl[:ys] + y) * tbl[:xs] + x
    tbl[:items][idx] = value
  end
end
