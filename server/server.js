const app = require("express")();
const http = require("http").createServer(app);
const io = require("socket.io")(http);
const cors = require("cors");
const PORT = process.env.PORT || 5000;
const { addUser, getUser, deleteUser, getUsers } = require("./users");

app.use(cors());

io.on("connection", (socket) => {
  socket.on("login", ({ name, room }, callback) => {
    const { user, error } = addUser(socket.id, name, room);
    if (error) return callback(error);

    numClients = getUsers(room).length;
    console.log(numClients);

    if (numClients <= 8) {
      socket.join(user.room);
      socket.in(room).emit("notification", {
        title: "Someone's here",
        description: `${user.name} just entered the room`,
      });
      io.in(room).emit("users", getUsers(room));
      callback();
    } else if (numClients >= 9) {
      socket.emit("notification", {
        title: "Room is full",
        description: `Room is full!`,
      });
    }
  });

  socket.on("sendMessage", async (message) => {
    const user = getUser(socket.id);
    io.in(user.room).emit("message", { user: user.name, text: message });
  });
  socket.on("sendMessage2", async (message) => {
    const user = getUser(socket.id);
    io.in(user.room).emit("message2", { user: user.name, text: message });
  });
  socket.on("sendMessage3", async (message) => {
    const user = getUser(socket.id);
    io.in(user.room).emit("message3", { user: user.name, text: message });
  });

  socket.on("disconnect", () => {
    console.log("User disconnected");
    const user = deleteUser(socket.id);
    if (user) {
      io.in(user.room).emit("notification", {
        title: "Someone just left",
        description: `${user.name} just left the room`,
      });
      io.in(user.room).emit("users", getUsers(user.room));
    }
  });
});

app.get("/", (req, res) => {
  res.send("Server is up and running");
});

http.listen(PORT, () => {
  console.log(`Listening to ${PORT}`);
});
