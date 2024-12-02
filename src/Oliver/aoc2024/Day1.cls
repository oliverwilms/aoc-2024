Class Oliver.aoc2024.Day1
{

Parameter Folder = "C:\AOC\AOC2024\";

Parameter InputFile = "input1.txt";

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
		set n1 = $P(line," ",1)
		Set n2 = $P(line," ",*)
		Set a1(ln) = n1
		Set a2(ln) = n2
		Continue
    }
    Set s1 = ..Sort(.a1,.o1)
    Set s2 = ..Sort(.a2,.o2)
    For ii=1:1:ln {
	    Set n1 = o1(ii)
	    Set n2 = o2(ii)
	    Set d = 0
	    If (n1 < n2) Set d = n2 - n1
	    If (n1 > n2) Set d = n1 - n2
	    Set sum = sum + d
    }
    return sum
}

ClassMethod Run(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)
    set sum=0
    set ln = 0
	while 'stream.AtEnd {
		set line=stream.ReadLine()
		set ln = ln + 1
		set n1 = $P(line," ",1)
		Set n2 = $P(line," ",*)
		Set a1(ln) = n1
		Set a2(ln) = n2
		Continue
    }
    //Set s1 = ..Sort(.a1,.o1)
    //Set s2 = ..Sort(.a2,.o2)
    For ii=1:1:ln {
	    Set n1 = a1(ii)
	    //Set n2 = o2(ii)
	    Set d = ..FindCount(n1,.a2)
	    //If (n1 < n2) Set d = n2 - n1
	    //If (n1 > n2) Set d = n1 - n2
	    Set sum = sum + (d * n1)
    }
    return sum
}

ClassMethod FindCount(fn, ByRef array) As %Integer
{
	Set c = 0
	Set ii = ""
	For {
		Set ii = $Order(array(ii),1,n)
		If (ii = "") Quit
		If (n = fn) Set c = c + 1
	}
	Quit c
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
