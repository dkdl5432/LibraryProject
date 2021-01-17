package vo;

public class SeatVO {
	private int seat_idx;	//1-24pc실 25-66열람실
	private int t1_mem_idx;//9-12
	private int t2_mem_idx;//12-15
	private int t3_mem_idx;//15-18
	
	public SeatVO() {
		// TODO Auto-generated constructor stub
		this.seat_idx=-1;
		this.t1_mem_idx=-1;
		this.t2_mem_idx=-1;
		this.t3_mem_idx=-1;	
	}
	
	public int getSeat_idx() {
		return seat_idx;
	}
	public void setSeat_idx(int seat_idx) {
		this.seat_idx = seat_idx;
	}
	public int getT1_mem_idx() {
		return t1_mem_idx;
	}
	public void setT1_mem_idx(int t1_mem_idx) {
		this.t1_mem_idx = t1_mem_idx;
	}
	public int getT2_mem_idx() {
		return t2_mem_idx;
	}
	public void setT2_mem_idx(int t2_mem_idx) {
		this.t2_mem_idx = t2_mem_idx;
	}
	public int getT3_mem_idx() {
		return t3_mem_idx;
	}
	public void setT3_mem_idx(int t3_mem_idx) {
		this.t3_mem_idx = t3_mem_idx;
	}
	
	
}
