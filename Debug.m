% Debug
clc; clear all; close all;

N_ref = 1;
N_guard = 1;
T = 5;

x = [1:5;5:9;9:13;13:17;17:21];
[noise_est,det_vect] = os_ca_cfar_2D(x, N_ref, N_guard, T);