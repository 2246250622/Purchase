using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class SuHelper 
{
    static string[] addresses = {
        "160.101.57.148",
        "160.101.107.98"
    };
    static string qsKey = "sudo";
    static string qsValue = "qwer";

    public static bool isSudoUser()
    {
        if (HttpContext.Current.Request.QueryString[qsKey] != qsValue)
            return false;

        foreach (var address in addresses)
        {
            if ((HttpContext.Current.Request.UserHostAddress as String).Equals(address))
                return true;
        }

        return false;
    }
    
}
