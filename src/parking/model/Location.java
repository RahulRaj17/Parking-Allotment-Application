package parking.model;

public class Location {
	private String location_name;
    private String latitude;
    private String longitude;
    private String capacity;
    private String rate;
    public String getLocationName() {
        return location_name;
    }
    public void setLocationName(String location_name) {
        this.location_name = location_name;
    }
    public String getLatitude() {
        return latitude;
    }
    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }
    public String getCapacity() {
        return capacity;
    }
    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }
    public String getLongitude() {
        return longitude;
    }
    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }
    public String getRate() {
        return rate;
    }
    public void setRate(String rate) {
        this.rate = rate;
    }
}
