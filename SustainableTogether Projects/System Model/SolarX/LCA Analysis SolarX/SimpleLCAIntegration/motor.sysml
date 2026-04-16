package MotorExample {

    public import ScalarValues::Real;
    public import ScalarValues::String;

    attribute def MaterialRef {
        attribute name : String;
        attribute database : String;
        attribute uuid : String;     // unique ID in the LCA database
    }

    part def Motor {
        attribute mass : ScalarValues::Real = 5.0;   // kg
        attribute material : MaterialRef {
            name = "steel hot rolled coil";
            database = "ELCD";
            uuid = "";    // resolved at runtime via SPARQL semantic match
        }
    }

    part motor : Motor;
}