using Xunit;
using System.IO;

namespace App.Tests;

public class UnitTest1
{
    [Fact]
    public void Prints_HelloWorld()
    {
        using var sw = new StringWriter();
        Console.SetOut(sw);

        Program.Main(Array.Empty<string>());

        Assert.Contains("Hello World", sw.ToString());
    }
}