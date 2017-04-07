# Dispatching exercise

The goal here is to see how far we can get writing a dispatcher that decides which crews to assign to different Lugg requests.

The `data` folder contains 3 datasets with different complexity. The idea is to feed them into a dispatcher script, like:

```
$ bundle exec dispatch.rb data/small.json
```

And have it parse the data and decide how to dispatch.

The datasets are formatted in JSON, like:

```
{
  workers: [
    {
      id: "John Malkovich",
      start_time: "2017-03-23T09:00:00-07:00",
      end_time: "2017-03-23T16:00:00-07:00",
      location: [-122.0370383, 37.5639754]
    }
  ],
  requests: [
    {
      id: "Al Santos",
      window: {
        from: "2017-03-23T13:00:00-07:00",
        to: "2017-03-23T14:00:00-07:00"
      },
      origin: [-122.4288782, 37.7743255],
      destination: [-122.4096115, 37.780037],
      task_duration: 1200,
    }
  ],
  worker_distance_matrix: [[3444]],
  destination_distance_matrix: [[506]],
}
```

Distance matrixes are encoded as:

- `worker_distance_matrix`: bidimensional array where a pair i,j represents the distance from worker i to request origin j in seconds
- `destination_distance_matrix`: bidimensional array where a pair i,j represents the distance from the destination of request i to the origin of request j
