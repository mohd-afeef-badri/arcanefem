//-----------------------------------------------------------------------------
//
// Name       : semi-circle.geo
// Author     : Mohd Afeef BADRI
// Date       : 19 / April / 2023
//
// ----------------------------------------------------------------------------
// Comment    : simple semi-circle problem mesh for elastodynamics/soildynamics
//
// Parameters : radius  - this is the radius of the semi-circle
//              meshSize- this is the mesh size of the
//
// Usage      : gmsh circle.geo -setnumber radius 50.0 -2 -format msh41
//
//
//-----------------------------------------------------------------------------

//==============================================================================
// ---- define parameters for commandline ----
//==============================================================================

DefineConstant[ radius = {50.0, Min .0001, Max 1000, Step 1,
                         Name "Parameters/radius radius"} ];

DefineConstant[ meshSize  = {1.0, Min 0.0001, Max 30, Step 1,
                         Name "Parameters/MeshSize MeshSize"} ];

DefineConstant[ input = {10.0, Min 1, Max 20, Step 1,
                         Name "Parameters/input input"} ];
                         
//==============================================================================
// ---- mesh size factor ----
//==============================================================================

h = meshSize;

//==============================================================================
// ---- points ----
//==============================================================================

Point(1) = {0, 0, 0, h};
Point(2) = {input/2., 0, 0, h};
Point(3) = {-input/2., 0, 0, h};
Point(4) = {-radius, 0, 0, h};
Point(5) = {radius, 0, 0, h};
Point(6) = {0, -radius, 0, h};

//==============================================================================
// ---- arcs ----
//==============================================================================

Circle(1) = {4, 1, 6};
Circle(2) = {6, 1, 5};

//==============================================================================
// ---- lines ----
//==============================================================================

Line(3) = {5, 2};
Line(4) = {2, 1};
Line(5) = {1, 3};
Line(6) = {3, 4};

//==============================================================================
// ---- surface ----
//==============================================================================

Curve Loop(1) = {6, 1, 2, 3, 4, 5};
Plane Surface(1) = {1};

//==============================================================================
// ---- groups ----
//==============================================================================

Physical Surface("soil", 7) = {1};
Physical Curve("lower", 8) = {1, 2};
Physical Curve("top", 9) = {6, 3};
Physical Curve("input", 10) = {5, 4};
Physical Point("source", 11) = {1};