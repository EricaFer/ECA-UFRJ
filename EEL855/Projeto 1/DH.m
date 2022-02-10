%MDL_KR5 Create model of Kuka KR5 manipulator
%
% MDL_KR5 is a script that creates the workspace variable mico which
% describes the kinematic characteristics of a Kuka KR5 manipulator using
% standard DH conventions.
%
% Also define the workspace vectors:
%   qk1        nominal working position 1
%   qk2        nominal working position 2
%   qk3        nominal working position 3
%
% Notes::
% - SI units of metres are used.
% - Includes 11.5cm tool in the z-direction
%
% Author::
% - Gautam sinha
%   Indian Institute of Technology, Kanpur.
%
% See also SerialLink, mdl_irb140, mdl_fanuc10l, mdl_motomanHP6, mdl_S4ABB2p8, mdl_puma560.

% MODEL: Kuka, KR5, 6DOF, standard_DH

%mdl_KR5 
%Define simplest line model for KUKA KR5 robot
%Contain DH parameters for KUKA KR5 robot
%All link lenghts and offsets are measured in cm
clear L
%            theta    d           a       alpha  type mdh  offset
L(1) = Link([0        0.2848     0 -pi/2 0 0], 'standard');
L(2) = Link([0        0.0        0  pi/2 0 0], 'standard');
L(3) = Link([0        0.4208     0 -pi/2 0 0], 'standard');
L(4) = Link([0        0.0        0  pi/2 0 0], 'standard');
L(5) = Link([0        0.3143     0 -pi/2 0 0], 'standard');
L(6) = Link([0        0          0  pi/2 0 0], 'standard');
L(7) = Link([0        0.1674     0  0    0 0], 'standard' );

kinova=SerialLink(L, 'name', 'Projeto 1 - Erica Ferreira');

q = [0 0 0 0 0 0 0 ];

kinova.teach(q)