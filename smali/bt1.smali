.class public final Lbt1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Ly82;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget-object v0, Lkr1;->c:Lmd1;

    .line 2
    .line 3
    const-string v1, "measurement.client.sessions.enable_fix_background_engagement"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-virtual {v0, v1, v2}, Lmd1;->g(Ljava/lang/String;Z)Ly82;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lbt1;->a:Ly82;

    .line 11
    .line 12
    return-void
.end method
