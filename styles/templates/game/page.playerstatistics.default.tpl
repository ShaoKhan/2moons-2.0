{block name="title" prepend}{$LNG.lm_playerstatistics}{/block}
{block name="content"}

    <div class="row">
        <div class="col-lg-12 content_page">
            <div><h2 class="buildings_headline">{$LNG.lm_playerstatistics}</h2></div>
       </div>

        <div class="col-12 content_page system-container" style="position: relative; height: 80vh; width: 84vw;">
            <canvas id="myChart"></canvas>
        </div>

        <script>
            const ctx = document.getElementById('myChart').getContext('2d');
            const myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30],
                    datasets: [
                        {
                            label: 'Bau',
                            data: [{', '|implode: $playerdata['buildings']}],
                            borderColor: '#24A903',
                            backgroundColor: '#24A903',
                            hoverBorderColor: "#30DB06",
                            pointStyle: 'circle',
                            pointRadius: 5,
                            pointHoverRadius: 10,
                        }, {
                            label: 'Forschung',
                            data: [{', '|implode: $playerdata['science']}],
                            borderColor: '#33B6FF',
                            backgroundColor: '#77c8f5',
                            hoverBorderColor: "#77C8F5FF",
                            pointStyle: 'circle',
                            pointRadius: 5,
                            pointHoverRadius: 10,

                        }, {
                            label: 'Schiffe',
                            data: [{', '|implode: $playerdata['fleet']}],
                            borderColor: '#FF3333',
                            backgroundColor: '#FF3333',
                            pointStyle: 'circle',
                            pointRadius: 5,
                            pointHoverRadius: 10

                        },{
                            label: 'Verteidigung',
                            data: [{', '|implode: $playerdata['defense']}],
                            borderColor: '#EEB31C',
                            backgroundColor: '#EEB31C',
                            pointStyle: 'circle',
                            pointRadius: 5,
                            pointHoverRadius: 10

                        },{
                            label: 'Gesamt',
                            data: [{', '|implode: $playerdata['summary']}],
                            borderColor: '#8B0738',
                            backgroundColor: '#8B0738',
                            pointStyle: 'circle',
                            pointRadius: 5,
                            pointHoverRadius: 10

                        }
                    ]
                },
                options: {
                    responsive: true,
                    plugins: {
                        title: {
                            display: false,
                            text: 'Punkteentwicklung',
                            color: '#FFFFFF',
                            font:{
                                size: 21
                            }

                        },
                        legend: {
                            display: true,
                            labels: {
                                color: '#FFFFFF',
                                font: {
                                    size: 14
                                }
                            }
                        },
                    },
                    scale: {
                        scaleLabel:{
                            fontColor: '#FFFFFF'
                        }
                    },
                    scales: {
                        x: {
                            display: true,
                            title: {
                                display: true,
                                text: 'letzte 30 Tage',
                                color: '#FFFFFF',
                            },
                            grid: {
                                drawBorder: false,
                                color: '#575656'
                            },
                            ticks: {
                                color: '#FFFFFF',
                            }

                        },
                        y: {
                            grid: {
                                drawBorder: false,
                                color: '#575656'
                            },
                            ticks: {
                                color: '#FFFFFF',
                            },
                            display: true,
                            drawBorder: true,
                            drawOnChartArea: true,
                            drawTicks: true,
                            beginAtZero: true,
                            title:{
                                display: true,
                                text: 'Punkte',
                                color: '#FFFFFF',

                            }
                        }
                    }
                }
            });
        </script>
    </div>
{/block}
