.class public final synthetic Lc92;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

.field public final synthetic k:Lxv1;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lxv1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lc92;->j:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

    .line 5
    .line 6
    iput-object p2, p0, Lc92;->k:Lxv1;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lc92;->k:Lxv1;

    .line 2
    .line 3
    :try_start_0
    invoke-interface {v0}, Lxv1;->c()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception v0

    .line 8
    iget-object p0, p0, Lc92;->j:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 11
    .line 12
    invoke-static {p0}, Lbh;->h(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 16
    .line 17
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 21
    .line 22
    const-string v1, "Failed to call IDynamiteUploadBatchesCallback"

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
