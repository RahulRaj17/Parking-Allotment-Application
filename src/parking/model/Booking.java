package parking.model;

public class Booking {
	private String name;
	private String slots;
	private String vehicle_number;
	private String in_time;
	private String out_time;
	public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getSlots() {
        return slots;
    }
    public void setSlots(String slots) {
        this.slots = slots;
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
}
