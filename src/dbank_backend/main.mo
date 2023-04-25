import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  stable var currentValue : Float = 3000;
  // currentValue := 3000;

  // let id = 8658987654890;

  public func topUp(amount: Float) {
    currentValue += amount;

    Debug.print(debug_show(currentValue));
  };

  public func changeValue(amount: Float) {
    currentValue := amount;

    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0){
      currentValue -= amount;

      Debug.print(debug_show(currentValue));

    }else{
      Debug.print("Insufficient Funds!");

    }
  };

  public query func checkBalance(): async Float{
    return currentValue;
  };

    stable var startTime = Time.now();
    // Debug.print(debug_show(startTime));

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 60000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }
}