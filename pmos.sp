  GNU nano 2.9.8                                                 pmos.sp                                                           

* pmos.sp
 *---------------------------------------------------------------------
* Parameters and models
 *---------------------------------------------------------------------

.option post

.temp 25
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Marino_Oviedo_I_2024_vlsi/Tutorial_1/Hspice/lp5mos/xt018.lib' tm
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Marino_Oviedo_I_2024_vlsi/Tutorial_1/Hspice/lp5mos/param.lib' 3s
.lib '/mnt/vol_NFS_rh003/Est_VLSI_I_2024/Marino_Oviedo_I_2024_vlsi/Tutorial_1/Hspice/lp5mos/config.lib' default

 *---------------------------------------------------------------------
* Simulation netlist
 *---------------------------------------------------------------------
*pmos
 Vgd   d   g   0
 Vsd   s   d   0
 xm19  d g s s pe w=720n l=180n as=3.456e-13 ad=3.456e-13 ps=2.4e-06 pd=2.4e-06
+ nrs=0.375 nrd=0.375 m='1*1' par1='1*1' xf_subext=0

*---------------------------------------------------------------------
* Stimulus
*---------------------------------------------------------------------
.dc Vgd 0 1.8 0.05 SWEEP Vsd 0 1.8 0.3
.plot I(Vsd) V(d)
.probe
.end


