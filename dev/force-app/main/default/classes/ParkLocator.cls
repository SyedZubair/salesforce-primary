public class ParkLocator 
{
    public static String[] country(string countryName)
    {
        ParkService.ParksImplPort parkSearcher = new ParkService.ParksImplPort();
        String[] parkNames = parkSearcher.byCountry(countryName);
        return parkNames;
    }
}