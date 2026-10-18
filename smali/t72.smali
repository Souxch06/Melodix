.class public final Lt72;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ly72;


# direct methods
.method public constructor <init>(Ly72;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lt72;->j:Ly72;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object p0, p0, Lt72;->j:Ly72;

    .line 2
    .line 3
    iget-object p0, p0, Ly72;->l:Li82;

    .line 4
    .line 5
    new-instance v0, Landroid/content/ComponentName;

    .line 6
    .line 7
    iget-object v1, p0, Let;->j:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Ly02;

    .line 10
    .line 11
    iget-object v1, v1, Ly02;->j:Landroid/content/Context;

    .line 12
    .line 13
    const-string v2, "com.google.android.gms.measurement.AppMeasurementService"

    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Li82;->w(Landroid/content/ComponentName;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
