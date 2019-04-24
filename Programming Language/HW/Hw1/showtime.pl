use LWP::Simple;
use HTML::Parse;
use utf8;

#binmode(STDIN,':encodeing(utf8)');
#binmode(STDOUT,':encodeing(utf8)');

$theater = "台南國賓影城";
utf8::encode($theater);
print "$theater\n";

##抓取HTML
$str1 = get 'http://www.atmovies.com.tw/showtime/theater_t06608_a06.html';

##切出每部電影
my @fragment1 = split ('"filmTitle">',$str1);

foreach $movie (@fragment1)
{	
	##找出電影名稱
	($title) = ($movie =~m|<a href="/movie/\w*/">(.*)</a>|);
	utf8::encode($title);
	print "$title\n";
	
	##找出電影版本
	if ($movie =~m|<li class="filmVersion">|)
	{
		($version) = $movie =~ m|<li class="filmVersion">(.*)</li>|;
		utf8::encode($version);
		print "$version\n";
	}

	##找出片長
	($length) = $movie =~ m|<li><.*/>(.*)</li>|;
	utf8::encode($length);
	print "$length\n";

##=begin
	@timetable = split ('<li>',$movie);
	foreach  $t (@timetable)
	{
		##找出時間
		if ($t =~m|(\d\d：\d\d)</li>|)
		{
			($time)= $t=~m|(\d\d：\d\d)</li>|;
			utf8::encode($time);
			print "$time\n";
		}
	}
##=end
##=cut
	print "\n";
}	

	print "\n\n\n";



$theater = "台南新光影城";
utf8::encode($theater);
print "$theater\n";
$str2 = get 'http://www.atmovies.com.tw/showtime/theater_t06607_a06.html';

my @fragment2 = split ('"filmTitle">',$str2);

foreach $movie (@fragment2)
{	
	($title) = ($movie =~m|<a href="/movie/\w*/">(.*)</a>|);
	utf8::encode($title);
	print "$title\n";

	if ($movie =~m|<li class="filmVersion">|)
	{
		($version) = $movie =~ m|<li class="filmVersion">(.*)</li>|;
		utf8::encode($version);
		print "$version\n";
	}

	($length) = $movie =~ m|<li><.*/>(.*)</li>|;
	utf8::encode($length);
	print "$length\n";

##=begin
	@timetable = split ('<li>',$movie);
	foreach  $t (@timetable)
	{
		if ($t =~m|(\d\d：\d\d)</li>|)
		{
			($time)= $t=~m|(\d\d：\d\d)</li>|;
			utf8::encode($time);
			print "$time\n";
		}
	}
##=end
##=cut
	print "\n";
}	
	print "\n\n\n";




$theater = "台南威秀影城";
utf8::encode($theater);
print "$theater\n";
$str3 = get 'http://www.atmovies.com.tw/showtime/theater_t06609_a06.html';

my @fragment3 = split ('"filmTitle">',$str3);

foreach $movie (@fragment3)
{	
	($title) = ($movie =~m|<a href="/movie/\w*/">(.*)</a>|);
	utf8::encode($title);
	print "$title\n";

	if ($movie =~m|<li class="filmVersion">|)
	{
		($version) = $movie =~ m|<li class="filmVersion">(.*)</li>|;
		utf8::encode($version);
		print "$version\n";
	}

	($length) = $movie =~ m|<li><.*/>(.*)</li>|;
	utf8::encode($length);
	print "$length\n";

##=begin
	@timetable = split ('<li>',$movie);
	foreach  $t (@timetable)
	{
		if ($t =~m|(\d\d：\d\d)</li>|)
		{
			($time)= $t=~m|(\d\d：\d\d)</li>|;
			utf8::encode($time);
			print "$time\n";
		}
	}
##=end
##=cut
	print "\n";
}	


