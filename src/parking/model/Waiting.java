package parking.model;

public class Waiting {
	private String name;
	private String email;
	private String phone;
	private String vehicle_number;
	private String in_time;
	private String out_time;
	private String location_name;
	public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getVehicleNumber() {
        return vehicle_number;
    }
    public void setVehicleNumber(String vehicle_number) {
        this.vehicle_number = vehicle_number;
    }
    public String getInTime() {
        return in_time;
    }
    public void setInTime(String in_time) {
        this.in_time = in_time;
    }
    public String getOutTime() {
        return out_time;
    }
    public void setOutTime(String out_time) {
        this.out_time = out_time;
    }
    public String getLocationName() {
        return location_name;
    }
    public void setLocationName(String location_name) {
        this.location_name = location_name;
    }
}
