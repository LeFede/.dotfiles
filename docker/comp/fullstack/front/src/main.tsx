import "./main.css";
import axios from "axios";

export function Main() {
  const onClick = async () => {
    const res = await axios.get("http://localhost:3000");
    console.log(res);
  };

  return (
    <>
      <button onClick={onClick}>A ver</button>
    </>
  );
}
