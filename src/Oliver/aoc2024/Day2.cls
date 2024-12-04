Class Oliver.aoc2024.Day2
{

Parameter Folder = "C:\AOC\AOC2024\";

Parameter InputFile = "input2.txt";

ClassMethod GetInput(fn) As %Stream
{
   
    set fn=..#Folder_fn
    set stream = ##Class(%Stream.FileCharacter).%New()
    set sc=stream.LinkToFile(fn)
    return stream
}

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)
    set sum=0
    set ln = 0
	while 'stream.AtEnd {
		set line=stream.ReadLine()
		set ln = ln + 1
		set sum = sum + ..AnalyzeReport(line)
		Continue
    }
    return sum
}

/// That's not the right answer; your answer is too high. (401)
/// That's not the right answer; your answer is too low.  (371)
ClassMethod Run(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)
    set sum=0
    set ln = 0
	while 'stream.AtEnd {
		set line=stream.ReadLine()
		set ln = ln + 1
		set sum = sum + ..AnalyzeReport2(line)
		Continue
    }
    return sum
}

ClassMethod AnalyzeReport(pReport As %String = "7 6 4 2 1") As %Integer
{
	Set dir = ""
	Set safe = 1
	Set len = $Length(pReport," ")
	For ii = 1:1:len {
		Set prev = $Get(level)
		Set level = $Piece(pReport," ",ii)
		If (ii = 1) Continue
		Set d = (level - prev)
		If (ii = 2) {
			If (d > 0) Set dir = "+"
			Else  Set dir = "-"
		}
		If (dir = "+"),((d < 1) ! (d > 3)) Set safe = 0 Quit
		If (dir = "-"),((d > -1) ! (d < -3)) Set safe = 0 Quit
	}
	Quit safe
}

ClassMethod AnalyzeReport2(pReport As %String = "7 6 4 2 1") As %Integer
{
	Set safe = ..AnalyzeReport(pReport)
	If safe Quit safe
	Set len = $Length(pReport," ")
	For removi = 1:1:len {
		Set report = ""
		For ii = 1:1:len {
			If (ii = removi) Continue
			Set level = $Piece(pReport," ",ii)
			If (report '= "") Set report = report_" "
			Set report = report_level
		}
		Set safe = ..AnalyzeReport(report)
		If safe { Quit }
	}
	Quit safe
}

ClassMethod Sort(ByRef input, ByRef output) As %Status
{
	Set tSC = 1
	For {
		Set ii = ""
		Set min = ""
		For {
			Set ii = $Order(input(ii),1,n)
			If (ii = "") Quit
			If (min = "") { Set min = n,x=ii }
			If (n < min)  { Set min=n,x=ii }
		}
		Set out = $I(output)
		Set output(out) = min
		Kill input(x)
		Set ii = $Order(input(ii))
		If (ii = "") Quit
	}
	Quit tSC
}

}
