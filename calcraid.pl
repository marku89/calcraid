#!/usr/bin/perl
# This little perl script calulates the best price for storage Raid setups
# Note , for 3-5 disks the calculation is raid 5  -> 1 disk redundance
#        for 6-10 disks the calculation is raid 6  -> 2 disks redundance
####
# mar@kola.li
####

use strict;
use warnings;

####
# Price for DISKS
## Check prices an ajust it !!!!
####
########## 1TB  2TB  3TB  4TB  5TB  6TB  7TB  8TB
my @disks=( 40,  56,  82, 112, 140, 180, 210, 225 ); # euro
my $tb;
my $data;
my $sum;
my $avg;
my @logic;
my ($out5,$out6,$avgtb);

####
# Begin Calc
####
for (my $i=3; $i <= 8; $i++) #count disks
{
   foreach (my $p=0; $p <= $#disks; $p++ ) # count TB
   {
      #if ( $i <= 6) # do the raid5 stuff
      #{
         $tb=$p+1;
         $data=($i-1)*$tb; 
         $sum=$i*$disks[$p];
         $avg=int($sum/$data); #gerundet 
	 $avgtb=int(($data/$sum)*1024); # gerundet
         #$out5 .="Raid5  $i=DISKs with $tb=TB , $data=TB , $sum euro,  avg: $avg euro/TB ,avgTB: $avgtb GB/euro\n";
         $out5 .="$avg euro/TB , Raid5  $i=DISKs with $tb=TB , $data=TB , $sum euro,  avg: $avg euro/TB ,avgTB: $avgtb GB/euro\n";
      #}
     # else # do the raid6 stuff
     # {
     #    $tb=$p+1;
     #    $data=($i-2)*$tb;
     #    $sum=$i*$disks[$p];
     #    $avg=int($sum/$data);
     #    $out6 .= "Raid6  $i=DISKs with $tb=TB , $data=TB , $sum euro,  avg: $avg euro/TB \n";
     # 
     # }
   }
}

#print "$out5";


####
# Find the best price for the most data space !
foreach my $in ($out5)
{
	
	print "$in\n"
}

####
# todo
