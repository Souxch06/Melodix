.class public final Les1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Ly82;

.field public static final b:Ly82;

.field public static final c:Ly82;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget-object v0, Lkr1;->c:Lmd1;

    .line 2
    .line 3
    const-string v1, "measurement.audience.refresh_event_count_filters_timestamp"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Lmd1;->g(Ljava/lang/String;Z)Ly82;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sput-object v1, Les1;->a:Ly82;

    .line 11
    .line 12
    const-string v1, "measurement.audience.use_bundle_end_timestamp_for_non_sequence_property_filters"

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Lmd1;->g(Ljava/lang/String;Z)Ly82;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sput-object v1, Les1;->b:Ly82;

    .line 19
    .line 20
    const-string v1, "measurement.audience.use_bundle_timestamp_for_event_count_filters"

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Lmd1;->g(Ljava/lang/String;Z)Ly82;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Les1;->c:Ly82;

    .line 27
    .line 28
    return-void
.end method
