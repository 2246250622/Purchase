using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// AuthHelper 的摘要描述
/// </summary>
public class AuthHelper 
{
    static string[] masks =
    {
        "160.101.57.148",
        "160.101.105.138",
        "160.101.105.186",
        "160.101.107.98",
        "160.101.105.57"
    };
    static string key = "Rank";
    public static string[] GMN = { "GMN" };
    public static string[] DOM = { "DOM" };
    public static string[] WM = { "WM", "WMP" };
    public static string[] SNO = { "SNO", "SNOE" };
    public static string[] NO = { "NO", "NOE", "NOP" };
    public static string[] NC = { "NC" };
    public static string[] ANC = { "ANC", "ANCP" };
    public static string[] NS = { "NS" };
    public static string[] SP = { "SP" };
    public static string[] APN = { "APN", "APNCP", "APNP" };
    public static string[] RN = { "RN", "RNP" };
    public static string[] EN = { "EN", "ENP" };
    public static string[] SYSADMIN = { "Sysadmin" };
    public static string[] ADMIN = { "Admin" };
    public static string[] POWERUSER = { "Power_user" };

    public static bool isSudoUser()
    {
        foreach (var mask in masks)
        {
            if ((HttpContext.Current.Request.UserHostAddress as String).Equals(mask))
                return true;
        }
        return false;
    }

    public static bool isRole(string[] roleAliases)
    {
        foreach (var role in roleAliases)
        {
            if ((HttpContext.Current.Session[key] as String) == role)
            {
                return true;
            }
        }

        return false;
    }

    public static bool isGmn()
    {
        return isRole(GMN);
    }

    public static bool isDom()
    {
        return isRole(DOM);
    }

    public static bool isWm()
    {
        return isRole(WM);
    }

    public static bool isSno()
    {
        return isRole(SNO);
    }

    public static bool isNo()
    {
        return isRole(NO);
    }

    public static bool isNc()
    {
        return isRole(NC);
    }

    public static bool isANc()
    {
        return isRole(ANC);
    }

    public static bool isNs()
    {
        return isRole(NS);
    }

    public static bool isSp()
    {
        return isRole(SP);
    }

    public static bool isApn()
    {
        return isRole(APN);
    }

    public static bool isRn()
    {
        return isRole(RN);
    }

    public static bool isEn()
    {
        return isRole(EN);
    }

    public static bool isSysadmin()
    {
        return isRole(SYSADMIN);
    }

    public static bool isAdmin()
    {
        return isRole(ADMIN);
    }

    public static bool isPoweruser()
    {
        return isRole(POWERUSER);
    }

    public static bool isSpecial()
    {
        return (isSysadmin() || isAdmin() || isPoweruser());
    }

    public static bool isDomLevel()
    {
        return (isDom() || isNo() || isNc() || isANc() || isSno() || isSp());
    }

    public static bool isWmLevel()
    {
        return (isWm() || isNs());
    }

    public static bool isAdminLevel()
    {
        return (isSpecial() || isGmn());
    }
}
