.class public final Lo42;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lka2;

.field public final synthetic k:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lka2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lo42;->j:Lka2;

    .line 5
    .line 6
    iput-object p1, p0, Lo42;->k:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lo42;->k:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 4
    .line 5
    iget-object v0, v0, Ly02;->v:Lc52;

    .line 6
    .line 7
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Lgx1;->l()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Lay1;->m()V

    .line 14
    .line 15
    .line 16
    iget-object v1, v0, Lc52;->m:Lka2;

    .line 17
    .line 18
    iget-object p0, p0, Lo42;->j:Lka2;

    .line 19
    .line 20
    if-eq p0, v1, :cond_1

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v1, 0x0

    .line 27
    :goto_0
    const-string v2, "EventInterceptor already set."

    .line 28
    .line 29
    invoke-static {v2, v1}, Lbh;->j(Ljava/lang/String;Z)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iput-object p0, v0, Lc52;->m:Lka2;

    .line 33
    .line 34
    return-void
.end method
