using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    /// <summary>
    /// Summary description for reportdata
    /// </summary>
    public class rpData
    {
        // Liste totale des clients
        public class Client
        {
            public string Name { get; set; }
            public decimal Balance { get; set; }
        }

        public static List<Client> Clients()
        {
            List<Client> cDs = new List<Client>();
            cDs.Add(new Client { Name = "Fred Manoch", Balance = 120 });
            cDs.Add(new Client { Name = "Carl Straus", Balance = 1011 });
            cDs.Add(new Client { Name = "Jamie Lao", Balance = 20 });
            cDs.Add(new Client { Name = "Severine Croix", Balance = 368 });
            cDs.Add(new Client { Name = "Tracy Tracy", Balance = 801 });
            cDs.Add(new Client { Name = "Kol Ba Jol", Balance = 190 });
            return cDs;
        }
    }
