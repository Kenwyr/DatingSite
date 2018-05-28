using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NodaTime;
using NodaTime.Extensions;

namespace Dating
{
    public class Bruger
    {
        public int BrugerID { get; set; }
        public string Fornavn { get; set; }
        public string Efternavn { get; set; }
        public DateTime Fødselsdato { get; set; }
        public DateTime Oprettelsesdato { get; set; }
        public int Køn { get; set; }
        public int SexOrientering { get; set; }
        public int Højde { get; set; }
        public double Vægt { get; set; }
        public string Brugernavn { get; set; }
        public string Passw { get; set; }
        public string Email { get; set; }
        public int PostNR { get; set; }

        public void OpretBruger(string fornavn, string efternavn, DateTime fødselsdato, int køn, int sexOrientering, int højde, double vægt, string brugernavn, string passw, string email, int postNR)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(Helper.CnnVal("Dating")))
            {
                List<Bruger> bruger = new List<Bruger>();
                bruger.Add(new Bruger { Fornavn = fornavn, Efternavn = efternavn, Fødselsdato = fødselsdato, Køn = køn, SexOrientering = sexOrientering, Højde = højde, Vægt = vægt, Brugernavn = brugernavn, Passw = passw, Email = email, PostNR = postNR });
                connection.Execute("Bruger_OpretBruger @Fornavn, @Efternavn, @Fødselsdato, @Oprettelsesdato, @Køn, @SexOrientering, @Højde, @Vægt, @Brugernavn, @Passw, @Email, @PostNR", bruger);

                // Debug dialog
                System.Windows.MessageBox.Show($"Bruger oprettet: {fornavn} {efternavn}");
            }
        }

        public void DeaktiverBruger(int brugerID)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(Helper.CnnVal("Dating")))
            {
                connection.Execute("Bruger_DeaktiverBruger @BrugerID", new { BrugerID = brugerID });

                // Debug dialog
                System.Windows.MessageBox.Show($"Bruger deaktiveret: {brugerID}");
            }
        }

        public void OpdaterBruger(int brugerID, string fornavn, string efternavn, DateTime fødselsdato, int køn, int sexOrientering, int højde, int vægt, string brugernavn, string passw, string email, int postNR)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(Helper.CnnVal("Dating")))
            {
                List<Bruger> bruger = new List<Bruger>();
                bruger.Add(new Bruger { BrugerID = brugerID, Fornavn = fornavn, Efternavn = efternavn, Fødselsdato = fødselsdato, Køn = køn, SexOrientering = sexOrientering, Højde = højde, Vægt = vægt, Brugernavn = brugernavn, Passw = passw, Email = email, PostNR = postNR });
                connection.Execute("Bruger_OpdaterBruger @BrugerID, @Fornavn, @Efternavn, @Fødselsdato, @Køn, @SexOrientering, @Højde, @Vægt, @Brugernavn, @Passw, @Email, @PostNR", bruger);

                // Debug dialog
                System.Windows.MessageBox.Show($"Bruger opdateret: {fornavn} {efternavn}");
            }
        }

        public List<Bruger> BrugerSøgning(string fornavn, string efternavn, DateTime alderStart, DateTime alderEnd, int køn, int sexOrientering, int højdeStart, int højdeEnd, int vægtStart, int vægtEnd, string brugernavn, string email, int postNRStart, int PostNREnd)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(Helper.CnnVal("Dating")))
            {
                return connection.Query<Bruger>("Bruger_BrugerSøgning @Fornavn, @Efternavn, @AlderStart, @AlderEnd, @Køn, @SexOrientering, @HøjdeStart, @HøjdeEnd, @VægtStart, @VægtEnd, @Brugernavn, @Email, @PostNRStart, @PostNREnd", new { Fornavn = fornavn, Efternavn = efternavn, AlderStart = alderStart.Date, AlderEnd = alderEnd.Date, Køn = køn, HøjdeStart = højdeStart, Højdeend = højdeEnd, VægtStart = vægtStart, VægtEnd = vægtEnd, Brugernavn = brugernavn, Email = email, PostNRStart = postNRStart, PostNREnd = PostNREnd }).ToList();
            }
        }

        public bool CheckLoginCredentials(int brugerID, string brugernavn, string passw)
        {
            bool validUser = false;
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(Helper.CnnVal("Dating")))
            {
                var bruger = connection.Query<Bruger>("Bruger_CheckLoginCredentials @BrugerID, @Brugernavn, @Passw", new { BrugerID = brugerID, Brugernavn = brugernavn, Passw = passw }).ToList().First();
                
                if (bruger != null)
                {
                    if (bruger.Brugernavn == brugernavn && bruger.Passw == passw)
                    {
                        validUser = true;
                    }
                    else
                    {
                        validUser = false;
                    }
                }

                return validUser;
            }
        }

        public int GetAlder(int brugerID)
        {
            using (IDbConnection connection = new System.Data.SqlClient.SqlConnection(Helper.CnnVal("Dating")))
            {
                LocalDate Fødselsdato = connection.Query<LocalDate>("Bruger_GetAlder @BrugerID", new { BrugerID = brugerID }).Single();

                //DateTimeZone zone = DateTimeZoneProviders.Tzdb["Europe/Copenhagen"];
                //ZonedClock clock = SystemClock.Instance.InZone(zone);
                //int Alder = Period.Between(Fødselsdato, clock.GetCurrentLocalDateTime().Date).Years;

                int Alder = Period.Between(Fødselsdato, SystemClock.Instance.InZone(DateTimeZoneProviders.Tzdb["Europe/Copenhagen"]).GetCurrentLocalDateTime().Date).Years;

                return Alder;
            }
        }
    }
}
