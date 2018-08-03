include <lasercut.scad>; 

thickness = 3.1;
nut_flat_width = 7;
x = 100;
y = 200;
z =  50;
height = 75;

module supportLeft()
{
    lasercutoutSquare(thickness=thickness, x=x, y=height,
        // edge, offset, inset, width, tab_thickness
        simple_tab_holes=[
            [0, .25, height/2, thickness, thickness], 
            [0, .75, height/2, thickness, thickness]
            ],
        captive_nuts=[
            // edge, offset, nut_flat_width
            [2, .5, nut_flat_width] 
            ],
        twist_holes=[
            // edge, center_x, center_y, length
            [0, x/2, height/4, height/2]
            ]
    );   
}

module supportRight()
{
    lasercutoutSquare(thickness=thickness, x=x, y=height,
        simple_tab_holes=[
            [0, .25, height/2, thickness, thickness], 
            [0, .75, height/2, thickness, thickness], 
        ],
        clips=[
            // edge, offset
            [2, .5]
        ],
        twist_holes=[
            // edge, center_x, center_y, length
            [0, x/2, height/4, height/2]
        ]
    );   
}

module stut()
{
    lasercutoutSquare(thickness=thickness, x=x, y=y-thickness*6,  
        simple_tabs=[
            // edge, offset, width, length
            [0, .75, thickness, thickness], [0, .25, thickness, thickness],
            [2, .75, thickness, thickness], [2, .25, thickness, thickness] 
            ]
        );   
}

module beam()
{
    rotate([0,90,0])
    lasercutoutSquare(thickness=thickness, x=height/2, y=y,
        twist_connect=[
            // edge, tab_size
            [0,thickness*2],
            [2,thickness*2]
            ]
        );   
}


module box()
{
    circles_remove_a = [
        [],
        [[x/4, x/2-thickness, y/2]]
    ];
    // edge, offset, inset, tab_thickness
    captive_nut_holes_a = [
        [ [0, .5, thickness, thickness] ]
    ];
    // edge, offset, inset, tab_thickness
    clip_holes_a = [
        [ [2, .5, thickness, thickness] ]
    ];
    lasercutoutBox(thickness = thickness, x=x, y=y, z=z, sides=6, captive_nut_holes_a = captive_nut_holes_a, clip_holes_a = clip_holes_a, circles_remove_a=circles_remove_a );
}


color("orange") translate([0,thickness*3,0]) rotate([90,0,0]) supportLeft();
color("yellow") translate([0,y-thickness*2,0]) rotate([90,0,0]) supportRight();
color("green") translate([0,thickness*3,height/2]) stut();
color("blue") translate([x/2-thickness/2,0,height/2]) beam();
color("violet") translate([0,0,height]) box();
