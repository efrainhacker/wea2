// Phantom Fingers font found at:
// https://www.1001fonts.com/phantom-fingers-font.html

// Note that the Fill function requires the development release of OpenSCAD
// https://openscad.org/downloads.html#snapshots

text = "Kshai";
size = 20;

namefont = "Noto Sans Balinese:style=Bold";
main_letter_height = 6;
background_thickness = -1; // Grosor del fondo del letrero
hollow_thickness = 0.3; // Grosor de la pared de las letras huecas

module sign_with_cutout(t = text) {
    difference() {
        // Fondo del letrero con recorte
        linear_extrude(main_letter_height + background_thickness)
            offset(size / 6)
                text(t, size, font = namefont);
        
        // Letras recortadas
        translate([0, 0, -background_thickness]) {
            linear_extrude(main_letter_height + background_thickness) {
                text(t, size, font = namefont);
            }
        }
    }
}

module hollow_letters(t = text) {
    difference() {
        // Letras principales
        linear_extrude(main_letter_height)
            text(t, size, font = namefont);
        
        // Crear hueco en las letras desde la parte superior
        translate([0, 0, hollow_thickness]) {
            linear_extrude(main_letter_height - hollow_thickness) {
                offset(-hollow_thickness)
                    text(t, size, font = namefont);
            }
        }
    }
}

// Generar el letrero con letras recortadas
translate([0, 0, 0])
    sign_with_cutout(text);

// Generar las letras huecas separadas
translate([0, -50, 0]) // Ajusta la posición para que no se solapen
    hollow_letters(text);

/*
// Custom kerned multi-line sign example
size = 9;
main_letter_height = 2;

union() {
    translate([0, 0, 0]) sign("Problem");
    translate([63, 0, 0]) sign("Sol");
    translate([84, 0, 0]) sign("ving");
    translate([23, -22, 0]) sign("isMyDrug");
    translate([23, -44, 0]) sign("ofChoice");
    color("darkslategray") translate([58, -15, 0]) cylinder(h = 1, d = 50);
}
*/

