use lib '.';
use inc::Module::Install;

RTx('RT-Extension-AdminDashboard');
license('gpl_2');
author('Torsten Brumm');
requires_rt('5.0.0');
rt_too_new('7.0.0');
sign(0);
WriteAll();
