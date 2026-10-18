.class public final Lp72;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lvv1;

.field public final synthetic k:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lvv1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lp72;->j:Lvv1;

    .line 5
    .line 6
    iput-object p1, p0, Lp72;->k:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lp72;->k:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 4
    .line 5
    iget-object v1, v1, Ly02;->r:Lcb2;

    .line 6
    .line 7
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 11
    .line 12
    iget-object v2, v0, Ly02;->H:Ljava/lang/Boolean;

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    iget-object v0, v0, Ly02;->H:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    :goto_0
    iget-object p0, p0, Lp72;->j:Lvv1;

    .line 28
    .line 29
    invoke-virtual {v1, p0, v0}, Lcb2;->c0(Lvv1;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
