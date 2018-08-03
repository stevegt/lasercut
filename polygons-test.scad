include <lasercut.scad>; 

thickness = 3.1;
color("red") {
    x = 100;
    y = 200;
    points = [[0,0], [x,0], [x,y], [x/2,y], [x/2,2*y/3], [0,y/2], [0,0]];
    // points = [[0,0], [x,0], [x,y], [0,y/2], [0,0]];
    // points = [[0,0], [x,0], [x,y], [0,y], [0,0]];
    // points = [[0,0], [x,0], [x,y], [0,0]];
    translate([10,20,0]) 
        lasercutout(
                thickness=thickness, 
                points = points,
                // side, offset, count
                bumpy_finger_joints=[[0, 0, 8], [4, .5, 8]]
                );
}

color("green") {
    x = 50;
    y = 100;
    // points = [[0,0], [x,0], [x,y], [0,y], [0,0]];
    points = [[0,0], [x,0], [x,2*y/3], [0,y], [0,0]];
    // points = [[0,0], [x,0], [x,y], [0,y/2], [0,0]];
    // points = [[0,0], [x,0], [x,y], [0,0]];
    translate([200,20,0]) 
        lasercutout(
                thickness=thickness, 
                points = points,
                // edge, tab_size
                twist_connect=[ [0,thickness*3], [2,thickness*3] ]
                );
}

color("blue") {
    x = 50;
    y = 100;
    // points = [[0,0], [x,0], [x,y], [0,y], [0,0]];
    points = [[0,0], [x,0], [x,2*y/3], [0,y], [0,0]];
    // points = [[0,0], [x,0], [x,y], [0,y/2], [0,0]];
    // points = [[0,0], [x,0], [x,y], [0,0]];
    translate([300,20,0]) 
        lasercutout(
                thickness=thickness, 
                points = points,
                // edge, offset, width, length
                simple_tabs=[
                    [1, .75, 2*thickness, thickness], 
                    [1, .25, 2*thickness, thickness],
                    [2, .75, thickness, thickness], 
                    [2, .25, thickness, thickness],
                    [3, .75, thickness, thickness], 
                    [3, .25, thickness, thickness],
                ],
                // edge, offset, inset, width, tab_thickness
                simple_tab_holes = [
                    [0, .5, thickness, 3*thickness, 2*thickness],
                    [1, .5, 2*thickness, 2*thickness, thickness],
                    [3, .25, thickness, 2*thickness, thickness],
                    [3, .75, thickness, 2*thickness, thickness]
                ]
                );
}

color("violet") {
    x = 50;
    y = 100;
    // points = [[0,0], [x,0], [x,y], [0,y], [0,0]];
    points = [[0,0], [x,0], [x,2*y/3], [0,y], [0,0]];
    // points = [[0,0], [x,0], [x,y], [0,y/2], [0,0]];
    // points = [[0,0], [x,0], [x,y], [0,0]];
    translate([400,20,0]) 
        lasercutout(
            thickness=thickness, 
            points = points,
            // edge, offset, width, length
            clips=[
                // edge, offset
                [1, .5]
            ],
            captive_nuts=[
                // edge, offset, nut_flat_width
                [2, .5, 7], 
                [3, .25, 7], 
                [3, .75, 7], 
            ]
        );
}

color("black") {
    x = 50;
    y = 100;
    // points = [[0,0], [x,0], [x,y], [0,y], [0,0]];
    points = [[0,0], [x,0], [x,2*y/3], [0,y], [0,0]];
    // points = [[0,0], [x,0], [x,y], [0,y/2], [0,0]];
    // points = [[0,0], [x,0], [x,y], [0,0]];
    translate([400-thickness, 20, thickness*2]) rotate([0,90,0])
        lasercutout(
            thickness=thickness, 
            points = points,
            // edge, offset, inset, tab_thickness
            captive_nut_holes = [
                [3, .25, thickness, thickness],
                [3, .75, thickness, thickness] 
            ]
        );
}

color("brown") {
    x = 50;
    y = 100;
    // points = [[0,0], [x,0], [x,y], [0,y], [0,0]];
    points = [[0,0], [x,0], [x,2*y/3], [0,y], [0,0]];
    // points = [[0,0], [x,0], [x,y], [0,y/2], [0,0]];
    // points = [[0,0], [x,0], [x,y], [0,0]];
    translate([450+thickness, 20, thickness*2-50]) rotate([0,-90,0])
        lasercutout(
            thickness=thickness, 
            points = points,
            // edge, offset, inset, tab_thickness
            clip_holes = [
                [1, .5, thickness, thickness] 
            ]
        );
}
    // edge, offset, inset, tab_thickness


module box()
{
    x = 50;
    y = 100;
    z = 50;
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

translate([500, 20, 0]) box();
