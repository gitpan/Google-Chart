my $str = 
"1XQbnf4";
"elg,ors";
"cEAELFJHUc";

"c9uDc";
"c9uDc";
"cLJHc";
"EAELFJHHHKUju9uuXUc";
"YUVmw1";
"UVVUVVUUUVVUSSVVVXXYadfhjlllllllmmliigdbbZZXVVUUUTU";
"pqokeYONOMEPOQVTXZdeca,Zcglprqxuuxztpoonkeggjp";
"pqokeYONOMEBAKPOQVTXZdecaZcglprqxuux393ztpoonkeggjp";
"cefhjkqwrlgYcfgc,QSSVXXdkfZUMRTUQ,HJJMOOUbVPKDHKLH";
"fSGBDQBQBBAGABCBDAKLCDGFCLBBEBBEPASDKJBDD9BHHEAACAC";
"Af9";
"93zyvneTTOMJMLIJFHEAECFJGHDBFCFIERcgnpy45879,IJKNUWUWYdnswz047977315533zy1246872tnkgcaZQONHCECAAAAEII";
"99,cefhjkqwrlgYcfgc,QSSVXXdkfZUMRTUQ,HJJMOOUbVPKDHKLH,AA";
"el,or";
"cEAELFJHHHKUju9uuXUc";
"foeZ9Gat,lkjtf3asv",
"984sttvuvkQIBLKNCAIi,DEJPgq0uov17zwopQODS,AFLPTXaflptx159gsDrn";
"voJATd9v,MW9BA9";
"FOETHECat,lkjtf3asv,KATYPSNXJ";
"EAELFJHHHKUju9uuXUc";
"984sttvuvkQIBLKNCAIipr3z9,DEJPgq0uov17_zwopQOD";
"Hello,1olrd";
"9gounjqGJD";
"HElowors1";
"ATSTaVd21981uocA";
"Hellobla";
"elo";
"FOETHEBar";
"Uf9a";
"helloworld";
#"fooZaroo";
#"formostthisamazingdayfortheleapinggreenlformostthisamazingdayfortheleapinggreenl";

my @ENCODE_VALUES = ('A'..'Z', 'a'..'z', 0..9);
my %REVERSE = map { ($ENCODE_VALUES[$_] => $_) } 0..$#ENCODE_VALUES;

while (length(my $c = substr($str, 0, 1, ''))) {
    if ($c eq ',') {
        print $c, " ";
    } elsif ($c eq '_') {
        print "undef", " ";
    } else {
        print $REVERSE{$c}, " ";
    }
}
print "\n";
