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
my @disks=( 40,  50,  80, 100, 130, 170, 210, 245 ); # euro
my $tb;
my $data;
my $sum;
my $avg;
my @logic;

####
# Begin Calc
####
for (my $i=3; $i <= 10; $i++) #count disks
{
   foreach (my $p=0; $p <= $#disks; $p++ ) # count TB
   {
      if ( $i <= 5) # do the raid5 stuff
      {
         $tb=$p+1;
         $data=($i-1)*$tb; 
         $sum=$i*$disks[$p];
         $avg=int($sum/$data);
         print "Raid5  $i=DISKs with $tb=TB , $data=TB , $sum euro,  avg: $avg euro \n";
      }
      else # do the raid6 stuff
      {
         $tb=$p+1;
         $data=($i-2)*$tb;
         $sum=$i*$disks[$p];
         $avg=int($sum/$data);
         print "Raid6  $i=DISKs with $tb=TB , $data=TB , $sum euro,  avg: $avg euro \n";
      
      }
   }
}

####
# Find the best price for the most data space !
####
# todo
