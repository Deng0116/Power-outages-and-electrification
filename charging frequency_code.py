import pandas as pd
import plotnine as pt

df_g = pd.read_csv("df_g.csv")
def plot_freq_week1(data, type_=None):
    data.rename(columns={'车辆类别': 'Type'}, inplace=True)
    if type_:
        data = data.query(f"Type=='{type_}'")
    plot = (
        pt.ggplot(data, pt.aes(x='充电开始时间', color='Type', fill='Type'))
        + pt.geom_density(alpha=0.1)
        + pt.xlab("Frequence")
        + pt.ylab("Density")
        + pt.facet_wrap("~Type", scales='free', ncol=2)
        + pt.theme_bw()
        + pt.theme(figure_size=(10, 5), panel_spacing_x=0.5, panel_spacing_y=0.2)
    )
    plot.save("test.png")
    return plot
plot_freq_week1(df_g, type_=None)


def plot_freq_week2(data):
    data.rename(columns={'车辆类别': 'Type'}, inplace=True)
    plot = (
        pt.ggplot(data, pt.aes(x='充电开始时间'))
        + pt.geom_density(alpha=0.1, fill='blue')
        + pt.xlab("Frequence")
        + pt.ylab("Density")
        + pt.theme_bw()
        + pt.theme(figure_size=(6, 4))
    )
    plot.save("test2.png")
    return plot
plot_freq_week2(df_g)