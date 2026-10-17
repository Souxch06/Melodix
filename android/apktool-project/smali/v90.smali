.class public final synthetic Lv90;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lcom/google/firebase/perf/session/gauges/GaugeManager;

.field public final synthetic l:Ljava/lang/String;

.field public final synthetic m:Lx9;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/perf/session/gauges/GaugeManager;Ljava/lang/String;Lx9;I)V
    .locals 0

    .line 1
    iput p4, p0, Lv90;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lv90;->k:Lcom/google/firebase/perf/session/gauges/GaugeManager;

    .line 4
    .line 5
    iput-object p2, p0, Lv90;->l:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p3, p0, Lv90;->m:Lx9;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget v0, p0, Lv90;->j:I

    .line 2
    .line 3
    iget-object v1, p0, Lv90;->m:Lx9;

    .line 4
    .line 5
    iget-object v2, p0, Lv90;->l:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Lv90;->k:Lcom/google/firebase/perf/session/gauges/GaugeManager;

    .line 8
    .line 9
    packed-switch v0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v2, v1}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->a(Lcom/google/firebase/perf/session/gauges/GaugeManager;Ljava/lang/String;Lx9;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_0
    invoke-static {p0, v2, v1}, Lcom/google/firebase/perf/session/gauges/GaugeManager;->d(Lcom/google/firebase/perf/session/gauges/GaugeManager;Ljava/lang/String;Lx9;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
