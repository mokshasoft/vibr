w = 0.031103

d = 40.6

t = 2.98

ymag = 8.3e10

prag = 0.37

{-
 - Vibration of a Circular Plate with Fixed Edge
 - calcdevice.com
 - Diameter (D)
 - Thickness (s)
 - Weight (m)
 - Young's modulus (E)
 - Poisson's ratio (ν)
 - f = 3.24*[[Es3 / 12(1 - ν2)]*[π/(m*D2)]]0.5
 -}
f0 _D s m _E v = 3.24 * sqrt (t1 * t2)
  where
    t1 = _E * (s ** 3) / (12 * (1 - (v ** 2)))
    t2 = pi / (m * (_D ** 2))

{-
 - Circular flat plate of uniform thickness t and radius r, edge free
 - calcdevice.com
 - Kn, D
 - K1 = 5.25 two nodal diameters
 - K2 = 9.08 one nodal circle
 - K3 = 12.2 three nodal diameters
 - K4 = 20.5 one nodal diameter and one nodal circle
 -}
f1 t r = kn * sqrt (d * g / (w * (r ** 4))) / (2 * pi)
  where
    kn = 1
    d = 1
    g = 1
    w = 1

{-
 - www.engineersedge.com/vibration/thin_flat_plates_uniform_thickness_14986.htm
 - clamped at center
 - B = 4.35, 24.26, 70.39, 138.85
 - clamped at edge
 - B = 11.84, 24.61, 40.41, 46.14, 103.12
 -}
f2 _B _E t p a v = _B * sqrt (t1 / t2)
  where
    t1 = _E * (t ** 2)
    t2 = p * (a ** 4) * (1 - (v ** 2))

main :: IO ()
main = do
  putStrLn $
    "clamped edge " ++
    show (f0 d t w ymag prag) ++ " Hz, should be 11707.129838336743 Hz"
